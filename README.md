# Conqrete Framework Tuist Template

![release](https://img.shields.io/github/v/release/conqrete/ConqreteFrameworkTuistTemplate?display_name=tag&sort=date)
![template validation](https://img.shields.io/github/workflow/status/conqrete/ConqreteFrameworkTuistTemplate/Validate%20Template?label=template%20validation)
![license](https://img.shields.io/github/license/conqrete/ConqreteFrameworkTuistTemplate)
![powered by tuist](https://img.shields.io/badge/powered%20by-Tuist-blue)

Conqrete's Tuist template for generating Conqrete framework project

# Installation

1. Prepare new fresh directory that will hold your Conqrete framework(s):
```sh
mkdir Conqrete && cd Conqrete
```

2. Clone Template and copy ites contents to `./Tuist/Templates/` by executing the script below:

```sh
git clone https://github.com/conqrete/ConqreteFrameworkTuistTemplate.git
```

> `tuist` looks for `Tuist` folder recursively from current recursively from directory to parent. 

After performing the script above, please validate the installation by executing the script below from same directory:

```sh
tuist scaffold list
```

# Usage

To bootstrap new Conqrete framework, execute following script (in ex., `ConqreteAnalytics` will be created):

```sh
tuist scaffold conqrete --fmwk-name Analytics --author $(git config user.name)
```

## Parameters list

This template supports following parameters

<table>
    <tr>
        <th>Paramter</th>
        <th>Parameter type</th>
        <th>Description</th>
        <th>Default value</th>
    </tr>
    <tr>
        <td><code>prefix</code></td>
        <td><code>optional</code></td>
        <td>
            <p>Prefix used for creating framework</p>
            <p>
                Do not change this if you are creating framework
                for <code>Conqrete</code> family
            </p>
        </td>
        <td><code>Conqrete</code></td>
    </tr>
    <tr>
        <td><code>fmwkName</code></td>
        <td><code>required</code></td>
        <td>
            <p>Framework name</p>
            <p>
                Do not include prefix <code>Conqrete</code>
                as it is included in <code>prefix></code> parameter by default
            </p>
        </td>
        <td></td>
    </tr>
    <tr>
        <td><code>author</code></td>
        <td><code>required</code></td>
        <td>
            <p>Author's git username</p>
            <p>
                Use <code>--author $(git config user.name)</code>
                to use current git username
            </p>
        </td>
        <td></td>
    </tr>
    <tr>
        <td><code>organizationIdentifier</code></td>
        <td><code>optional</code></td>
        <td>
            <p>Organization identifier</p>
            <p>
                Do not change this if you are creating framework
                for <code>Conqrete</code> family
            </p>
        </td>
        <td><code>com.conqrete</code></td>
    </tr>
    <tr>
        <td><code>year</code></td>
        <td><code>optional</code></td>
        <td>
            <p>Current year string in <code>YYYY</code> ISO format</p>
            <p>
                Do not change this as current year
                is filled by default
            </p>
            <p>
                Default value uses simple <code>DateFormatter</code> to make string from current date
            </p>
        </td>
        <td>
            <code>yearDateFormatter.string(from: Date())</code>
        </td>
    </tr>
    <tr>
        <td><code>date</code></td>
        <td><code>optional</code></td>
        <td>
            <p>Current year string in <code>YYYY</code> ISO format</p>
            <p>
                Do not change this as current year
                is filled by default
            </p>
            <p>
                Default value uses simple <code>DateFormatter</code> to make string from current date
            </p>
        </td>
        <td>
            <code>defaultDateFormatter.string(from: Date())</code>
        </td>
    </tr>
    <tr>
        <td><code>swiftVersion</code></td>
        <td><code>optional</code></td>
        <td>
            <p>Swift version to use in generated project</p>
        </td>
        <td><code>5.6</code></td>
    </tr>
    <tr>
        <td><code>tuistVersion</code></td>
        <td><code>optional</code></td>
        <td>
            <p>Tuist version to use in generated project</p>
            <p>Goes to <code>.tuist-version</code> file</p>
        </td>
        <td><code>3.9.0</code></td>
    </tr>
    <tr>
        <td><code>rubyVersion</code></td>
        <td><code>optional</code></td>
        <td>
            <p>Ruby version to use in generated project</p>
            <p>Goes to <code>.ruby-version</code> file</p>
        </td>
        <td><code>3.1.1</code></td>
    </tr>
    <tr>
        <td><code>projectVersion</code></td>
        <td><code>optional</code></td>
        <td>
            <p>Project's version</p>
            <p>
                Goes to generated
                <code>.current-project-version</code> file
            </p>
            <p>Used as <code>.xcodeproj</code>'s project version</p>
        </td>
        <td><code>1</code></td>
    </tr>
    <tr>
        <td><code>marketingVersion</code></td>
        <td><code>optional</code></td>
        <td>
            <p>Project's marketing version</p>
            <p>Goes to several generated files</p>
            <p>Used as <code>.xcodeproj</code>'s marketing project version</p>
        </td>
        <td><code>0.9.0</code></td>
    </tr>
</table>
