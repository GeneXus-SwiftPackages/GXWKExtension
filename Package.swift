// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXWKExtension",
	platforms: [.iOS("13.0"), .watchOS("9.0")],
	products: [
		.library(
			name: "GXWKExtension",
			targets: ["GXWKExtensionWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.2.0-beta.24"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUIApplication.git", exact: "2.2.0-beta.24")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXWKExtension-2.2.0-beta.24.xcframework.zip",
			checksum: "9afbf371b183f9c0162eb8b02cba0a890fe18beecc83395fd5d484a59d458523"
		)
	]
)