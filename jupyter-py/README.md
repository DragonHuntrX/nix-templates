<div align=center>

# ❄️ nix-template-jupyter-py 🐍

[![NixOS](https://img.shields.io/badge/Made_for-Python-blue.svg?logo=python)](https://nixos.org) [![NixOS](https://img.shields.io/badge/Flakes-Nix-informational.svg?logo=nixos)](https://nixos.org) ![License](https://img.shields.io/github/license/mordragt/nix-template-python) 

Minimal **Jupyter** development template for **Python**

</div>

#### Who is this for

- Someone who wants to apply Nix's power for Python development.
- Who's not very comfortable with Flakes (you still need to have a basic understanding)
- Need something minimal that *just works*™

#### Reference

1. [wiki/Flakes](https://nixos.wiki/wiki/Flakes)❗Read the output schema carefully (especially `defaultPackage`, `legacyPackages` and `devShells`)❗
2. [Jupyter](https://jupyter.org/) - used for the python notebooks
3. [JupyterWith](https://github.com/tweag/jupyterWith/tree/main) - used to create jupyter kernels

#### So how do I use it ??

Click on the `Use this template` button (https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template)
and run `nix flake update .` to update the flake lock
For more information about the configuration with JupyterWith look [here](https://github.com/tweag/jupyterWith/tree/main/template)

#### Commands

- `nix develop`: opens up a `bash` shell with jupyter environment
- `nix build` : builds the jupyter environment to the symbolic `result` directory
- `nix run`: runs the Jupyter web service

#### FAQ

... Waiting for questions ... (raise an issue in case of doubts)

#### Support

Consider starring the repo ⭐🐍

#### Acknowledgments

- [Rust template](https://github.com/helium18/template-nix) which gave the inspiration