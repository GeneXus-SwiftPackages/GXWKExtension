// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXWKExtension",
	platforms: [.iOS("12.0"), .watchOS("9.0")],
	products: [
		.library(
			name: "GXWKExtension",
			targets: ["GXWKExtensionWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.6.0-beta.3"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUIApplication.git", exact: "1.6.0-beta.3")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXWKExtension-1.6.0-beta.3.xcframework.zip",
			checksum: "7bd871cf8f656ab7f8de3f76384f4aeef925774dc371f09b264e151cdcbfca84"
		)
	]
)