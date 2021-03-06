Collection of useful scripts.

Note: For first time use make sure scripts are made executable:

```bash
chmod +x <script>
```

## The scripts

1. Take last n Azure ML runs

```bash
aml_run
# autome-clm_1620532518_2e2a4ccc

aml_run -t 3
# autome-clm_1620532518_2e2a4ccc
# autome-clm_1620363984_0a3fa53b
# autome-clm_1620362203_c81c40e2

aml_run -t 3 -v
# 2021-05-09T04:00 autome-clm_1620532518_2e2a4ccc (Completed)
# 2021-05-07T05:09 autome-clm_1620363984_0a3fa53b (Completed)
# 2021-05-07T04:39 autome-clm_1620362203_c81c40e2 (Completed)

aml_run -t 3 -v --url
# 2021-05-09T04:00 autome-clm_1620532518_2e2a4ccc (Completed)
# https://ml.azure.com/runs/autome-clm_162053...
# 
# 2021-05-07T05:09 autome-clm_1620363984_0a3fa53b (Completed)
# https://ml.azure.com/runs/autome-clm_162036...
# 
# 2021-05-07T04:39 autome-clm_1620362203_c81c40e2 (Completed)
# https://ml.azure.com/runs/autome-clm_162036...

aml_run ... --no-update
# doesn't check aml for new runs, just rely on existing cache
# => faster, but ignores any new runs
```

2. Download Azure ML logs and fire up a tensorboard server


## Some notes

To make python files executable:

1. Shebang:

```
#!/usr/bin/env python
```

2. Make file executable

```bash
chmod +x myscript.py
```

3. Execute

```bash
./myscript.py
```

4. Optional: Remove `.py` extension so you can call `myscript ...` from the shell. (Linux only)

5. Optional: Add dotfiles/scripts to path

Add this to `.zshrc`:

```bash
export PATH="~/dotilfes/scripts":$PATH
```

Now you can call your scripts from anywhere.
