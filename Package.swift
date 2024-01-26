// swift-tools-version: 5.7
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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.4.0-beta.19"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUIApplication.git", exact: "1.4.0-beta.19")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXWKExtension-1.4.0-beta.19.xcframework.zip",
			checksum: "7234a4bf06f2275ec58aabef36777cda373a5e35e9ff8e2d735e90b9ce1046c1"
		)
	]
)