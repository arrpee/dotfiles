import subprocess
import os
import sys

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

    with open(
        os.path.join(sys.path[0], "theme/themes/Arrpee-color-theme.json.template")
    ) as f:
        templated_theme = f.read()

    for k in reversed(sorted(mappings.keys())):
        templated_theme = templated_theme.replace(k, mappings[k])

    with open(
        os.path.join(sys.path[0], "theme/themes/Arrpee-color-theme.json"), "w"
    ) as f:
        f.write(templated_theme)
