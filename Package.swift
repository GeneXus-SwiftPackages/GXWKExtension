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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.2.0-beta.10"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXUIApplication.git", exact: "1.2.0-beta.10")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXWKExtension-1.2.0-beta.10.xcframework.zip",
			checksum: "28d69ef8be3582fdaab5a560a8b8761e560ff70ecab614696aaf4c3b011002c0"
		)
	]
)