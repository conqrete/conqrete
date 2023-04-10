import Foundation
import ProjectDescription

// MARK: - Date Helpers

let yearDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY"
    return formatter
}()
let now = Date()
let yearString = yearDateFormatter.string(from: now)

// MARK: - Attributes

let projectNameAttribute: Template.Attribute = .required("name")
let organizationIdentifierAttribute: Template.Attribute = .required("organization")

let yearAttribute: Template.Attribute = .optional("year", default: yearString)
let swiftVersionAttribute: Template.Attribute = .optional("swiftVersion", default: "5.8")
let deploymentTargetAttribute: Template.Attribute = .optional("deploymentTarget", default: "15.0")
let tuistVersionAttribute: Template.Attribute = .optional("tuistVersion", default: "3.17.0")
let rubyVersionAttribute: Template.Attribute = .optional("rubyVersion", default: "3.1.1")
let projectVersionAttribute: Template.Attribute = .optional("projectVersion", default: "1")
let marketingVersionAttribute: Template.Attribute = .optional("marketingVersion", default: "0.9.0")

// MARK: - Tuist Template Helpers

let name: String = "\(projectNameAttribute)"
let appTargetName: String = name
let flowsTargetName: String = "\(name)Flows"
let servicesTargetName: String = "\(name)Services"
let navigationTargetName: String = "\(name)Navigation"
let uiTargetName: String = "\(name)UI"
let coreTargetName: String = "\(name)Core"

enum ProjectFolder {
    case projectRoot
    case tuistRoot
    case tuistProjectDescriptionHelpers
    case tuistProjectDescriptionSharedHelpers
    case scripts
    case fastlane
    case githubActions

    case appSources, appResources, appTests, appSupportFiles
    case flowsSources, flowsTests, flowsSupportFiles
    case servicesSources, servicesTests, servicesSupportFiles
    case navigationSources, navigationSupportFiles
    case uiSources, uiResources, uiSupportFiles
    case coreSources, coreTests, coreSupportFiles

    /// template folder path to reference .stencil-file from
    var templateFolderPath: String {
        switch self {
        case .projectRoot:
            return "ProjectRootTemplateFiles/"

        case .tuistRoot:
            return "TuistTemplateFiles/"

        case .tuistProjectDescriptionHelpers:
            return "TuistTemplateFiles/ProjectDescriptionHelpers/"

        case .tuistProjectDescriptionSharedHelpers:
            return "TuistTemplateFiles/ProjectDescriptionHelpers/Shared/"

        case .scripts:
            return "ScriptsTemplateFiles/"

        case .fastlane:
            return "FastlaneTemplateFiles/"

        case .githubActions:
            return "GithubActionsTemplateFiles/"

        case .appSources, .appResources, .appTests, .appSupportFiles:
            return "AppTemplateFiles/"

        case .flowsSources, .flowsTests, .flowsSupportFiles:
            return "FlowsTemplateFiles/"

        case .servicesSources, .servicesTests, .servicesSupportFiles:
            return "ServicesTemplateFiles/"

        case .navigationSources, .navigationSupportFiles:
            return "NavigationTemplateFiles/"

        case .uiSources, .uiResources, .uiSupportFiles:
            return "UITemplateFiles/"

        case .coreSources, .coreTests, .coreSupportFiles:
            return "CoreTemplateFiles/"
        }
    }

    /// output folder path that the file will be generated to
    var outputFolderPath: String {
        switch self {
        case .projectRoot:
            return ""
        
        case .tuistRoot:
            return "Tuist/"

        case .tuistProjectDescriptionHelpers:
            return "Tuist/ProjectDescriptionHelpers/"

        case .tuistProjectDescriptionSharedHelpers:
            return "Tuist/ProjectDescriptionHelpers/Shared/"

        case .scripts:
            return "Scripts/"

        case .fastlane:
            return "fastlane/"

        case .githubActions:
            return ".github/workflows/"

        case .appSources:
            return "\(appTargetName)/Sources/"

        case .appResources:
            return "\(appTargetName)/Resources/"

        case .appTests:
            return "\(appTargetName)Tests/Sources/"

        case .appSupportFiles:
            return "\(appTargetName)/SupportFiles/"

        case .flowsSources:
            return "\(flowsTargetName)/Sources/"

        case .flowsTests:
            return "\(flowsTargetName)Tests/Sources/"

        case .flowsSupportFiles:
            return "\(flowsTargetName)/SupportFiles/"

        case .servicesSources:
            return "\(servicesTargetName)/Sources/"

        case .servicesTests:
            return "\(servicesTargetName)Tests/Sources/"

        case .servicesSupportFiles:
            return "\(servicesTargetName)/SupportFiles/"

        case .navigationSources:
            return "\(navigationTargetName)/Sources/"

        case .navigationSupportFiles:
            return "\(navigationTargetName)/SupportFiles/"

        case .uiSources:
            return "\(uiTargetName)/Sources/"

        case .uiResources:
            return "\(uiTargetName)/Resources/"

        case .uiSupportFiles:
            return "\(uiTargetName)/SupportFiles/"

        case .coreSources:
            return "\(coreTargetName)/Sources/"

        case .coreTests:
            return "\(coreTargetName)Tests/Sources/"

        case .coreSupportFiles:
            return "\(coreTargetName)/SupportFiles/"
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
    description: "Conqrete app template",
    attributes: [
        projectNameAttribute,
        organizationIdentifierAttribute,
        yearAttribute,
        swiftVersionAttribute,
        deploymentTargetAttribute,
        tuistVersionAttribute,
        rubyVersionAttribute,
        projectVersionAttribute,
        marketingVersionAttribute
    ],
    items: [
        // Project Root files
        .file(.projectRoot, file: ".current-project-version", template: "CurrentProjectVersion"),
        .file(.projectRoot, file: ".gitignore", template: "Gitignore"),
        .file(.projectRoot, file: ".ruby-version", template: "RubyVersion"),
        .file(.projectRoot, file: ".swiftlint.yml", template: "Swiftlint"),
        .file(.projectRoot, file: ".tuist-version", template: "TuistVersion"),
        .file(.projectRoot, file: "Gemfile"),
        .file(.projectRoot, file: "LICENSE", template: "License"),
        .file(.projectRoot, file: "README.md", template: "Readme"),
        .swiftFile(.projectRoot, file: "Project"),
        .swiftFile(.projectRoot, file: "Workspace"),
        // Tuist Root files
        .swiftFile(.tuistRoot, file: "Config"),
        .swiftFile(.tuistRoot, file: "Dependencies"),
        // Tuist ProjectDescriptionHelpers files
        .swiftFile(.tuistProjectDescriptionHelpers, file: "App"),
        .swiftFile(.tuistProjectDescriptionHelpers, file: "Flows"),
        .swiftFile(.tuistProjectDescriptionHelpers, file: "Services"),
        .swiftFile(.tuistProjectDescriptionHelpers, file: "Navigation"),
        .swiftFile(.tuistProjectDescriptionHelpers, file: "UI"),
        .swiftFile(.tuistProjectDescriptionHelpers, file: "Core"),
        // Tuist ProjectDescriptionHelpers shared files
        .swiftFile(.tuistProjectDescriptionSharedHelpers, file: "DeploymentTarget"),
        .swiftFile(.tuistProjectDescriptionSharedHelpers, file: "ProjectConstants"),
        .swiftFile(.tuistProjectDescriptionSharedHelpers, file: "Scheme"),
        .swiftFile(.tuistProjectDescriptionSharedHelpers, file: "Settings"),
        .swiftFile(.tuistProjectDescriptionSharedHelpers, file: "SettingsDictionary"),
        .swiftFile(.tuistProjectDescriptionSharedHelpers, file: "TargetScript"),
        .swiftFile(.tuistProjectDescriptionSharedHelpers, file: "Target"),
        // Script files
        .file(.scripts, file: "bump-project-version.sh", template: "BumpProjectVersion"),
        .file(.scripts, file: "generate-project.sh", template: "GenerateProject"),
        .file(.scripts, file: "clean.sh", template: "Clean"),
        // Fastlane files
        .file(.fastlane, file: "AppFile"),
        .file(.fastlane, file: "FastFile"),
        // GitHub Actions files
        .file(.githubActions, file: "build-and-test.yml", template: "BuildAndTestWorkflow"),
        // App files
        .swiftFile(.appSources, file: "AppDelegate"),
        .swiftFile(.appSources, file: "ViewController"),
        .swiftFile(.appTests, file: "AppTests"),
        .file(.appSupportFiles, file: "Info.plist", template: "Info"),
        .file(.appResources, file: "Assets.xcassets/Contents.json", template: "Assets"),
        .file(.appResources, file: "Assets.xcassets/AppIcon.appiconset/Contents.json", template: "AppIcon"),
        .file(.appResources, file: "LaunchScreen.storyboard", template: "LaunchScreen"),
        // Flows files
        .swiftFile(.flowsSources, file: "Flows"),
        .swiftFile(.flowsTests, file: "FlowsTests"),
        .file(.flowsSupportFiles, file: "Info.plist", template: "Info"),
        // Serives files
        .swiftFile(.servicesSources, file: "Services"),
        .swiftFile(.servicesTests, file: "ServicesTests"),
        .file(.servicesSupportFiles, file: "Info.plist", template: "Info"),
        // Navigation files
        .swiftFile(.navigationSources, file: "Navigation"),
        .file(.navigationSupportFiles, file: "Info.plist", template: "Info"),
        // UI files
        .swiftFile(.uiSources, file: "UI"),
        .file(.uiResources, file: "Assets.xcassets/Contents.json", template: "Assets"),
        .file(.uiSupportFiles, file: "Info.plist", template: "Info"),
        // Core files
        .swiftFile(.coreSources, file: "Core"),
        .swiftFile(.coreTests, file: "CoreTests"),
        .file(.coreSupportFiles, file: "Info.plist", template: "Info"),
    ]
)
