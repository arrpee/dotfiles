import subprocess, os, sys
from jinja2 import Environment, FileSystemLoader


if __name__ == "__main__":
    xresources = subprocess.check_output(["xrdb", "-query", "-all"]).decode("utf-8")

    xresources_dict = {
        y[0]: y[1]
        for y in [x.split(":") for x in xresources.replace("\t", "").split("\n")]
        if len(y) == 2
    }

    mappings = {
        "xr_foreground": xresources_dict["*.foreground"],
        "xr_background": xresources_dict["*.background"],
    }

    mappings.update(
        {f"xr_{x}": xresources_dict[f"*{x}"] for x in [f"color{i}" for i in range(16)]}
    )

    env = Environment(loader=FileSystemLoader(sys.path[0]))
    template = env.get_template("arrpee.rasi.jinja")

    with open(os.path.join(sys.path[0], "arrpee.rasi"), "w") as f:
        f.write(template.render(mappings=mappings))
