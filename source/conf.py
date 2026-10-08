# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Latency Sensitive Workload Tuning Guide'
copyright = '2025, Intel, Red Hat'
author = 'Intel, Red Hat'
release = '1.0'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = []

templates_path = ['_templates']
exclude_patterns = []



# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'alabaster'
html_static_path = ['_static']
html_css_files = ['css/custom.css']

latex_elements = {
    'preamble': r'''
\usepackage{array}
\setlength{\extrarowheight}{2pt} % optional for better spacing
''',
    # Force all columns to be paragraph columns with wrapping
    'tablecolsep': r'\renewcommand{\tabularxcolumn}[1]{p{#1}}',
'preamble': r'''
\usepackage[utf8]{inputenc}
\DeclareUnicodeCharacter{03BC}{$\mu$}
''',
}
