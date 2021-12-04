import ProjectDescription

let project = Project(
    name: "iDelivery",
    organizationName: "com.kimxwan0319",
    targets: [
        Target(
            name: "iDelivery",
            platform: .iOS,
            product: .app,
            bundleId: "com.kimxwan0319.iDelivery",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: .iphone),
            infoPlist: .file(path: Path("SupportingFiles/Info.plist")),
            sources: ["Sources/**"],
            resources: [
                "Resources/**"
            ],
            actions: [
                TargetAction.pre(
                    script: "${PODS_ROOT}/SwiftLint/swiftlint",
                    name: "SwiftLint"
                )
            ],
            dependencies: [],
            coreDataModels: [
                CoreDataModel(
                    Path("Sources/Data/CoreData/CoreData.xcdatamodeld"),
                    currentVersion: nil)
            ]
        ),
        Target(
            name: "iDeliveryTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.kimxwan0319.iDeliveryTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "iDelivery"),
                .cocoapods(path: ".")
            ]
        )
    ]
)
