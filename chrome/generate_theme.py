import subprocess, os, sys
from jinja2 import Environment, FileSystemLoader


def hex_to_rgb(hex):
    lst = [str(int(hex[i : i + 2], 16)) for i in (0, 2, 4)]
    return "[" + ",".join(lst) + "]"


if __name__ == "__main__":
    xresources = subprocess.check_output(["xrdb", "-query", "-all"]).decode("utf-8")

    xresources_dict = {
        y[0]: y[1]
        for y in [x.split(":") for x in xresources.replace("\t", "").split("\n")]
        if len(y) == 2
    }

    mappings = {
        "xr_foreground": hex_to_rgb(xresources_dict["*.foreground"][1:]),
        "xr_background": hex_to_rgb(xresources_dict["*.background"][1:]),
    }

    mappings.update(
        {
            f"xr_{x}": hex_to_rgb(xresources_dict[f"*{x}"][1:])
            for x in [f"color{i}" for i in range(16)]
        }
    )

    env = Environment(loader=FileSystemLoader(sys.path[0]))
    template = env.get_template("theme/manifest.json.jinja")

    with open(os.path.join(sys.path[0], "theme/manifest.json"), "w") as f:
        f.write(template.render(mappings=mappings))
