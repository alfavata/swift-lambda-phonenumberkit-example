# Using swift-lambda to build and deploy
# See https://github.com/SwiftXcode/swift-lambda

LAMBDA_NAME=swift-lambda-phonenumberkit-example

install:
	brew install SPMDestinations/tap/swift-lambda

build:
	swift lambda build \
		--verbose \
		--configuration release \
		--product $(LAMBDA_NAME)

deploy:
	swift lambda deploy \
		--verbose \
		--configuration release \
		--product $(LAMBDA_NAME) \
		--function $(LAMBDA_NAME)
