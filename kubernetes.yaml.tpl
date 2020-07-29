apiVersion: apps/v1
kind: Deployment
metadata:
  name: cicdgck8
  labels:
    app: cicdgck8
spec:
  replicas: 1
  selector:
    matchLabels:
      app: cicdgck8
  template:
    metadata:
      labels:
        app: cicdgck8
    spec:
      containers:
      - name: cicdgck8
        image: gcr.io/GOOGLE_CLOUD_PROJECT/cicdgck8-build:COMMIT_SHA
        ports:
        - containerPort: 8080
---
kind: Service
apiVersion: v1
metadata:
  name: cicdgck8
spec:
  selector:
    app: cicdgck8
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  type: LoadBalancer