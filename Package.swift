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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.0.7"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUIApplication.git", exact: "4.0.7")
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
			url: "https://pkgs.genexus.dev/iOS/releases/GXWKExtension-4.0.7.xcframework.zip",
			checksum: "943d636ef4f40c8f983a4b816c93103cc82a124c9bbb7d7327e435b473c6694a"
		)
	]
)