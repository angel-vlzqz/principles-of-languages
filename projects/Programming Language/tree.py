import javalang
import json
from bs4 import BeautifulSoup

def generate_ast(java_file_path):
    with open(java_file_path, 'r') as file:
        java_code = file.read()

    try:
        tree = javalang.parse.parse(java_code)
        return tree
    except javalang.parser.JavaSyntaxError as e:
        print(f"Error parsing Java file: {e}")
        return None

def node_to_dict(node):
    node_dict = {'type': str(type(node))}
    for attr in node.attrs:
        value = getattr(node, attr)
        if isinstance(value, list):
            value = [node_to_dict(child) if isinstance(child, javalang.tree.Node) else str(child) for child in value]
        elif isinstance(value, javalang.tree.Node):
            value = node_to_dict(value)
        else:
            value = str(value)
        node_dict[attr] = value
    return node_dict

def get_node_roles(node):
    roles = {}
    for attr in node.attrs:
        value = getattr(node, attr)
        if isinstance(value, list):
            roles[attr] = [get_node_roles(child) if isinstance(child, javalang.tree.Node) else str(child) for child in value]
        elif isinstance(value, javalang.tree.Node):
            roles[attr] = get_node_roles(value)
        else:
            roles[attr] = str(value)
    return roles

if __name__ == "__main__":
    java_file_path = "HelloWorld.java"  # Hardcoded filename
    ast = generate_ast(java_file_path)

    if ast:
        ast_dict = node_to_dict(ast)
        roles_dict = get_node_roles(ast)
        with open('output.json', 'w') as f:  # Open output.json in write mode
            json.dump(ast_dict, f, indent=2)  # Write the AST
        with open('roles.json', 'w') as f:  # Open roles.json in write mode
            json.dump(roles_dict, f, indent=2)  # Write the roles dictionary to the file as JSON

        # Traverse the AST and store node types in data structures
        identifiers = []
        reserved_words = []

        def traverse_ast(node):
            if isinstance(node, javalang.tree.InterfaceDeclaration):
                identifiers.append(node.name)
            elif isinstance(node, javalang.tree.ReservedWord):
                reserved_words.append(node.value)

            for _, child_node in node:
                traverse_ast(child_node)

        traverse_ast(ast)

        # Print the identifiers and reserved words
        print(identifiers)
        print(reserved_words)
        
