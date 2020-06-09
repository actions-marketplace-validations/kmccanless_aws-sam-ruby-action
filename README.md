# aws-sam-ruby-action
Github Action for Building or Deploying Ruby 2.7 Serverless Apps.  This action uses a custom docker image with Ruby 2.7
and AWS SAM CLI.  

#Inputs

### `sam_command`

**REQUIRED** Allowed values are 'build' or 'deploy'

### Environment Variables

The following environment variables are required:

For the 'build' command:
- AWS_ACCESS_KEY
- AWS_SECRET_ACCESS_KEY
- AWS_REGION

For the 'deploy command':
- AWS_ACCESS_KEY
- AWS_SECRET_ACCESS_KEY
- AWS_REGION (unless defined in a .toml file)
- S3_BUCKET (unless defined in a .toml file)
- STACK_NAME (unless defined in a .toml file)
- CAPABILITIES (unless defined in a .toml file)

## Example

```yaml
- name: sam build
        uses: kmccanless/aws-sam-ruby-action@master
        with:
          sam_command: build
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_REGION: ${{ secrets.AWS_REGION }}
      - name: sam deploy
        uses: kmccanless/aws-sam-ruby-action@master
        with:
          sam_command: deploy
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_REGION: ${{ secrets.AWS_REGION }}
          S3_BUCKET: ${{ secrets.S3_BUCKET }}
          STACK_NAME: "sam-lambda-ruby-example"
          CAPABILITIES: "CAPABILITY_IAM"
```

