ZIP = deterministic-zip
ASSET_ZIP = bootstrap.zip
S3_BUCKET_NAME = dev-lambda-deploy-rust-999bbb
S3_OBJECT_KEY = MyFirstLambda/$(ASSET_ZIP)

zip: $(ASSET_ZIP) 

$(ASSET_ZIP): lambda_function.py
	$(ZIP) $@ $<

upload: $(ASSET_ZIP)
	# create an S3 bucket if it does not exist
	aws s3api head-bucket --bucket $(S3_BUCKET_NAME) 2>/dev/null ||  aws s3 mb s3://$(S3_BUCKET_NAME)
	# enable versioning
	aws s3api put-bucket-versioning \
		--bucket $(S3_BUCKET_NAME) \
		--versioning-configuration Status=Enabled
	# upload ASSET
	aws s3api put-object \
		--bucket $(S3_BUCKET_NAME) \
		--key $(S3_OBJECT_KEY) \
		--body $(ASSET_ZIP) \
		--checksum-algorithm sha256

.PHONY: zip upload