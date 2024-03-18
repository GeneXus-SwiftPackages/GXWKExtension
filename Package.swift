// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXWKExtension",
	platforms: [.iOS("12.0"), .watchOS("5.0")],
	products: [
		.library(
			name: "GXWKExtension",
			targets: ["GXWKExtensionWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.3.6"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUIApplication.git", exact: "1.3.6")
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
			url: "https://pkgs.genexus.dev/iOS/releases/GXWKExtension-1.3.6.xcframework.zip",
			checksum: "25c1a859a66d119c0a83b147856f264c06f2dcf4f2d44284511b7c696a311f48"
		)
	]
)