[![release](https://img.shields.io/github/v/release/conqrete/ConqreteFrameworkTuistTemplate?display_name=tag&sort=date)](https://github.com/conqrete/conqrete/releases)
[![template validation](https://img.shields.io/github/actions/workflow/status/conqrete/conqrete/validate-templates.yml?branch=main&label=template%20validation)](https://github.com/conqrete/conqrete/actions/workflows/validate-template.yml)
[![license](https://img.shields.io/github/license/conqrete/conqrete)](https://github.com/conqrete/conqrete/blob/main/LICENSE)
[![powered by tuist](https://img.shields.io/badge/powered%20by-Tuist-blue)](https://tuist.io)

![conqrete logotype](./Resources/conqrete-logo.png)

Conqrete is a set of [Tuist](https://tuist.io) templates for bootstrapping iOS app or framework projects

# Installation

## One-shot script

```sh
mkdir Conqrete && cd Conqrete
git clone https://github.com/conqrete/ConqreteFrameworkTuistTemplate.git
mkdir -p ./Tuist/Templates/
cp -R ./ConqreteFrameworkTuistTemplate/Tuist/Templates/conqrete ./Tuist/Templates/
rm -rf ConqreteFrameworkTuistTemplate
tuist scaffold list
```

## Step by step guide

<details>
  <summary>Show steps</summary>
  
  ### 1. Prepare new fresh directory that will hold your Conqrete framework(s):
  ```sh
  mkdir Conqrete && cd Conqrete
  ```

  ### 2. Clone Template and copy its contents to `./Tuist/Templates/` by executing the script below:

  ```sh
  git clone https://github.com/conqrete/ConqreteFrameworkTuistTemplate.git
  ```

  ### 3. Copy conqrete template to Tuist directory
  Copy contets of cloned Tuist template to `./Tuist/Templates/` by executing following script:

  ```sh
  mkdir -p ./Tuist/Templates/
  cp -R ./ConqreteFrameworkTuistTemplate/Tuist/Templates/conqrete ./Tuist/Templates/
  ```

  > `tuist` tool will looks for `/Tuist` directory recursively from current directory to parent.

  ### 4. Validate installation

  After performing the script above, validate the installation by executing the script below from same directory:

  ```sh
  tuist scaffold list
  ```

  The output should look line this:

  ```
  Name                Description
  ──────────────────  ───────────────────────────
  default             Default template
  swiftui             SwiftUI template
  conqrete-app        Conqrete app template
  conqrete-framework  Conqrete framework template
  ```

  The last line means that `tuist` has successfully detected `conqrete` template and is ready to use via `scaffold` or `init -t` commands

  5. You could remove the cloned repo afterwards

  ```sh
  rm -rf ConqreteFrameworkTuistTemplate
  ```

</details>

# Usage

After installing conqrete, 2 new templates must be available for using with `tuist scaffold`:
- `conqrete-app` - the template to use for bootstraping iOS app
- `conqrete-framework` - the template to use for bootstraping iOS framework

## App template

TBD

## Framework template

To bootstrap new Conqrete framework, execute following script (in ex., `MyFramework` will be created):

```sh
tuist scaffold conqrete-framework --name MyFramework --organization com.myOrganization
```

> Note that template has 2 required parameters:
> - `name` - the name of the framewok. By default, it is appended to prefix `Conqrete`
> - `organization` - the organization in reversed domain style like `com.orgnaizationDomain`

>
> You could examine full list of parameters below at the section **Parameters list**

The result of executing this command will be the new folder `./ConqreteAnalytics` with generated content ready for development and maintenance. After bootstraping the project, you must use generated scripts for easier generation of project via Tuist:

```sh
cd ConqreteAnalytics
chmod -R +x ./Scripts
./Scripts/generate-project.sh
```

Custom script will generate `.xcodeproj` and `.xcworkspace` without opening it. To open workspace in Xcode locate current folder and double click on `ConqreteAnalytics.xcworkspace` or execute this script from terminal:

```sh
open ./ConqreteAnalytics.xcworkspace
```

## Usage notes

- You must use `tuist scaffold conqrete-...` and not `tuist init -t conqrete-...` as `init` command currently has a few limitations:
  - it does not accept parameters
  - it could only be used within empty directory

## Parameters list

Both templates supports following list of parameters:

<table>
    <tr>
        <th>Paramter</th>
        <th>Command line usage example</th>
        <th>Parameter type</th>
        <th>Description</th>
        <th>Default value</th>
    </tr>
    <tr>
        <td><code>name</code></td>
        <td><code>--name CoolApp</code></td>
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
        <td><code>organization</code></td>
        <td><code>--organization com.myOrganization</code></td>
        <td><code>optional</code></td>
        <td>
            <p>
                Organization identifier in reversed domain notation
            </p>
            <p>
                All bundle identifiers will be prefixed using this value
            </p>
        </td>
        <td></td>
    </tr>
    <tr>
        <td><code>year</code></td>
        <td><code>--year 2022</code></td>
        <td><code>optional</code></td>
        <td>
            <p>Current year string in <code>YYYY</code> ISO format</p>
            <p>Current year is filled by default</p>
            <p>
                Default value uses simple <code>DateFormatter</code> to make string from current date
            </p>
        </td>
        <td>
            <code>yearDateFormatter.string(from: Date())</code>
        </td>
    </tr>
    <tr>
        <td><code>swiftVersion</code></td>
        <td><code>--swift-version 5.8</code></td>
        <td><code>optional</code></td>
        <td>
            <p>Swift version to use in generated project</p>
        </td>
        <td><code>5.8</code></td>
    </tr>
    <tr>
        <td><code>tuistVersion</code></td>
        <td><code>--tuist-version 3.17.0</code></td>
        <td><code>optional</code></td>
        <td>
            <p>Tuist version to use in generated project</p>
            <p>Goes to <code>.tuist-version</code> file</p>
        </td>
        <td><code>3.17.0</code></td>
    </tr>
    <tr>
        <td><code>rubyVersion</code></td>
        <td><code>--ruby-version 3.1.1</code></td>
        <td><code>optional</code></td>
        <td>
            <p>Ruby version to use in generated project</p>
            <p>Goes to <code>.ruby-version</code> file</p>
        </td>
        <td><code>3.1.1</code></td>
    </tr>
    <tr>
        <td><code>projectVersion</code></td>
        <td><code>--project-version 1</code></td>
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
        <td><code>--marketing-version 0.9.0</code></td>
        <td><code>optional</code></td>
        <td>
            <p>Project's marketing version</p>
            <p>Goes to several generated files</p>
            <p>Used as <code>.xcodeproj</code>'s marketing project version</p>
        </td>
        <td><code>0.9.0</code></td>
    </tr>
</table>
