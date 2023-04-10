import Foundation
import ProjectDescription

// MARK: - Date Helpers

let yearDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY"
    return formatter
}()
let defaultDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd.MM.YYYY"
    return formatter
}()
let now = Date()
let yearString = yearDateFormatter.string(from: now) ?? "2022"
let dateString = defaultDateFormatter.string(from: now) ?? "15.08.2022"

// MARK: - Attributes

let projectNameAttribute: Template.Attribute = .required("name")
let authorAttribute: Template.Attribute = .required("author")
let organizationIdentifierAttribute: Template.Attribute = .required("organization")

let yearAttribute: Template.Attribute = .optional("year", default: yearString)
let dateAttribute: Template.Attribute = .optional("date", default: dateString)

let swiftVersionAttribute: Template.Attribute = .optional("swiftVersion", default: "5.8")
let deploymentTargetAttribute: Template.Attribute = .optional("deploymentTarget", default: "15.0")
let tuistVersionAttribute: Template.Attribute = .optional("tuistVersion", default: "3.17.0")
let rubyVersionAttribute: Template.Attribute = .optional("rubyVersion", default: "3.1.1")
let projectVersionAttribute: Template.Attribute = .optional("projectVersion", default: "1")
let marketingVersionAttribute: Template.Attribute = .optional("marketingVersion", default: "0.9.0")

// MARK: - Tuist Template Helpers

let name: String = "\(projectNameAttribute)"
let frameworkTargetName: String = name
let frameworkTestsTargetName: String = "\(name)Tests"
let demoAppTargetName: String = "\(name)Demo"


enum ProjectFolder {

    case demoAppResources
    case demoAppSources
    case demoAppSupportFiles
    case fastlane
    case frameworkSources
    case frameworkSupportFiles
    case frameworkTests
    case githubActions
    case projectRoot
    case scripts
    case tuistRoot
    case tuistProjectDescriptionHelpers

    /// template folder path to reference .stencil-file from
    var templateFolderPath: String {
        switch self {
        case .demoAppResources, .demoAppSources, .demoAppSupportFiles:
            return "DemoAppTemplateFiles/"
        
        case .fastlane:
            return "FastlaneTemplateFiles/"

        case .frameworkSources, .frameworkSupportFiles, .frameworkTests:
            return "FrameworkTemplateFiles/"

        case .githubActions:
            return "GithubActionsTemplateFiles/"

        case .projectRoot:
            return "ProjectRootTemplateFiles/"

        case .scripts:
            return "ScriptsTemplateFiles/"

        case .tuistRoot:
            return "TuistTemplateFiles/"

        case .tuistProjectDescriptionHelpers:
            return "TuistTemplateFiles/ProjectDescriptionHelpers/"
        }
    }

    /// output folder path that the file will be generated to
    var outputFolderPath: String {
        switch self {
        case .demoAppResources:
            return "\(demoAppTargetName)/Resources/"
        
        case .demoAppSources:
            return "\(demoAppTargetName)/Sources/"
        
        case .demoAppSupportFiles:
            return "\(demoAppTargetName)/SupportFiles/"

        case .fastlane:
            return "fastlane/"

        case .frameworkSources:
            return "\(frameworkTargetName)/Sources/"

        case .frameworkSupportFiles:
            return "\(frameworkTargetName)/SupportFiles/"

        case .frameworkTests:
            return "\(frameworkTestsTargetName)/Sources/"

        case .githubActions:
            return ".github/workflows/"

        case .projectRoot:
            return ""

        case .scripts:
            return "Scripts/"
        
        case .tuistRoot:
            return "Tuist/"

        case .tuistProjectDescriptionHelpers:
            return "Tuist/ProjectDescriptionHelpers/"
        }
    }
}

func templateFilePath(
    _ folder: ProjectFolder, 
    _ file: String
) -> Path {
    return "./\(folder.templateFolderPath)\(file)"
}

func projectFilePath(
    _ folder: ProjectFolder,
    _ path: String
) -> String {
    return "./\(name)/\(folder.outputFolderPath)\(path)"
}

extension Template.Item {

    static func file(
        _ folder: ProjectFolder,
        file: String,
        template: String
    ) -> Template.Item {
        return Template.Item.file(
            path: projectFilePath(folder, file),
            templatePath: templateFilePath(folder, "\(template).stencil")
        )
    }

    static func file(
        _ folder: ProjectFolder,
        file: String
    ) -> Template.Item {
        return .file(
            folder,
            file: file,
            template: file
        )
    }

    static func swiftFile(
        _ folder: ProjectFolder,
        file: String,
        template: String
    ) -> Template.Item {
        return .file(
            folder,
            file: "\(file).swift",
            template: template
        )
    }

    static func swiftFile(
        _ folder: ProjectFolder,
        file: String
    ) -> Template.Item {
        return .file(
            folder,
            file: "\(file).swift",
            template: file
        )
    }
}

// MARK: - Template

let template = Template(
    description: "Conqrete framework template",
    attributes: [
        projectNameAttribute,
        authorAttribute,
        organizationIdentifierAttribute,
        yearAttribute,
        dateAttribute,
        swiftVersionAttribute,
        deploymentTargetAttribute,
        tuistVersionAttribute,
        rubyVersionAttribute,
        projectVersionAttribute,
        marketingVersionAttribute
    ],
    items: [
        // Demo App files
        .swiftFile(.demoAppSources, file: "AppDelegate"),
        .swiftFile(.demoAppSources, file: "ViewController"),
        .file(.demoAppSupportFiles, file: "Info.plist", template: "Info"),
        .file(.demoAppResources, file: "Assets.xcassets/Contents.json", template: "Assets"),
        .file(.demoAppResources, file: "Assets.xcassets/AppIcon.appiconset/Contents.json", template: "AppIcon"),
        .file(.demoAppResources, file: "LaunchScreen.storyboard", template: "LaunchScreen"),
        // Fastlane files
        .file(.fastlane, file: "AppFile"),
        .file(.fastlane, file: "FastFile"),
        // Framework files
        .file(.frameworkSources, file: "\(name).swift", template: "Framework"),
        .file(.frameworkSupportFiles, file: "Info.plist", template: "Info"),
        .file(.frameworkTests, file: "\(name)Tests.swift", template: "FrameworkTests"),
        // GitHub Actions files
        .file(.githubActions, file: "build-and-test.yml", template: "BuildAndTestWorkflow"),
        // Project Root files
        .file(.projectRoot, file: ".current-project-version", template: "CurrentProjectVersion"),
        .file(.projectRoot, file: ".gitignore", template: "Gitignore"),
        .file(.projectRoot, file: ".ruby-version", template: "RubyVersion"),
        .file(.projectRoot, file: ".swiftlint.yml", template: "Swiftlint"),
        .file(.projectRoot, file: ".tuist-version", template: "TuistVersion"),
        .file(.projectRoot, file: "Gemfile"),
        .file(.projectRoot, file: "LICENSE", template: "License"),
        .file(.projectRoot, file: "README.md", template: "Readme"),
        .swiftFile(.projectRoot, file: "Package"),
        .swiftFile(.projectRoot, file: "Project"),
        .swiftFile(.projectRoot, file: "Workspace"),
        // Script files
        .file(.scripts, file: "bump-project-version.sh", template: "BumpProjectVersion"),
        .file(.scripts, file: "generate-project.sh", template: "GenerateProject"),
        .file(.scripts, file: "clean.sh", template: "Clean"),
        .file(.scripts, file: "validate-package.sh", template: "ValidatePackage"),
        // Tuist Root files
        .swiftFile(.tuistRoot, file: "Config"),
        .swiftFile(.tuistRoot, file: "Dependencies"),
        // Tuist ProjectDescriptionHelpers files
        .swiftFile(.tuistProjectDescriptionHelpers, file: "DeploymentTarget"),
        .swiftFile(.tuistProjectDescriptionHelpers, file: "ProjectConstants"),
        .swiftFile(.tuistProjectDescriptionHelpers, file: "Scheme"),
        .swiftFile(.tuistProjectDescriptionHelpers, file: "Settings"),
        .swiftFile(.tuistProjectDescriptionHelpers, file: "SettingsDictionary"),
        .swiftFile(.tuistProjectDescriptionHelpers, file: "Target"),
        .swiftFile(.tuistProjectDescriptionHelpers, file: "TargetDependency"),
        .swiftFile(.tuistProjectDescriptionHelpers, file: "TargetReference"),
        .swiftFile(.tuistProjectDescriptionHelpers, file: "TargetScript")
    ]
)
