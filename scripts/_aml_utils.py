import argparse
from azureml.core import Workspace

def aml_workspace_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument("--name", "-n", default="amsaied-ws")
    parser.add_argument("--group", "-g", default="amsaied-rg")
    parser.add_argument("--subscription", "-s", default="48bbc269-ce89-4f6f-9a12-c6f91fcb772d")
    return parser

def workspace_from_args(args):
    ws = Workspace(
        subscription_id=args.subscription,
        resource_group=args.group,
        workspace_name=args.name,
    )
    return ws