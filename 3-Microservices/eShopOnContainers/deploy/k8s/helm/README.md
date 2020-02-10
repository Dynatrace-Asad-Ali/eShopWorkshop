# helm upates

updated to accommodate helm 3 on AKS 1.14+

## erratta:
- had to hardcode some elements of images and content to get eShop to work correctly
  - apigw* changed to envoyproxy/envoy-dev  (envoryproxy/envoy:dev as templated doesn't work)
  - webmvc changed to eshop/webmvc:linux-dev (eshop/webmvc:dev kept crashing and I suspect it is a windows container)
- removed mobile marketing and mobile shopping API services because they failed to deploy with errors.
- helm 3 templating didn't like the .Values.ingress.mesh.annotations and had to be changed to .Values.ingress.annotations
  - not sure if that broke anything further
  - did this with a sed command from the './helm' directory
 	<pre>find ./ -type f -exec sed -i '' -e 's/.Values.ingress.mesh.annotations/.Values.ingress.annotations/g' {} \</pre>
