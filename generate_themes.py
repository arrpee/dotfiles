#!/usr/bin/env python3

import os
import subprocess
from jinja2 import Environment, FileSystemLoader


def hex_to_rgb(hex_col):
    """
    Converts a hex string to an rgb list

    """
    hex_col = hex_col[1:]
    lst = [int(hex_col[i : i + 2], 16) for i in (0, 2, 4)]
    return lst


def find_jinja_dirs():
    template_paths = set()
    for root, dirs, files in os.walk(os.path.dirname(os.path.abspath(__file__))):
        for file in files:
            if file.endswith(".jinja"):
                template_paths.add(root)

    return template_paths


def process_templates(template_paths):

    xresources = subprocess.check_output(["xrdb", "-query", "-all"]).decode("utf-8")
    xresources_dict = {
        y[0]: y[1]
        for y in [x.split(":") for x in xresources.replace("\t", "").split("\n")]
        if len(y) == 2
    }

    mappings = {
        "xr_fg": xresources_dict["*.foreground"],
        "xr_bg": xresources_dict["*.background"],
        "xr_ac1": xresources_dict["accent1"],
        "xr_ac2": xresources_dict["accent2"],
    }

    mappings.update(
        {f"xr_{x}": xresources_dict[f"*{x}"] for x in [f"color{i}" for i in range(16)]}
    )

    for i in template_paths:
        env = Environment(loader=FileSystemLoader(searchpath=i))
        env.globals["hex_to_rgb"] = hex_to_rgb
        for j in env.list_templates():

            if not j.endswith("jinja"):
                continue

            template = env.get_template(j)
            with open(os.path.join(i, j[:-6]), "w") as f:
                f.write(template.render(mappings=mappings))


if __name__ == "__main__":
    template_paths = find_jinja_dirs()
    process_templates(template_paths)
