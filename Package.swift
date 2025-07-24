// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXWKExtension",
	platforms: [.iOS("15.0"), .watchOS("10.0")],
	products: [
		.library(
			name: "GXWKExtension",
			targets: ["GXWKExtensionWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.2.0-beta.29"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUIApplication.git", exact: "3.2.0-beta.29")
	],
	targets: [
		.target(name: "GXWKExtensionWrapper",
				dependencies: [
					"GXWKExtension",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.watchOS])),
					.product(name: "GXUIApplication", package: "GXUIApplication", condition: .when(platforms: [.iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXWKExtension",
			url: "https://pkgs.genexus.dev/iOS/beta/GXWKExtension-3.2.0-beta.29.xcframework.zip",
			checksum: "16362ef935600f0bf47a305929351723027eeac8af90dabac0c611dd46dea6e1"
		)
	]
)