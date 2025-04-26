# open-notebook Helm Chart

This Helm chart deploys the `open_notebook` application along with its required database, `surrealdb`. 

## Prerequisites

- Kubernetes cluster
- Helm 3.x installed

## Installation

To install the chart, use the following command:

```bash
helm install open-notebook ./open-notebook
```

## Configuration

You can customize the deployment by modifying the `values.yaml` file. The following parameters can be configured:

- `surrealdb.image`: The Docker image for SurrealDB (default: `surrealdb/surrealdb:v2`)
- `open_notebook.image`: The Docker image for Open Notebook (default: `lfnovo/open_notebook:latest`)
- `open_notebook.environment`: Environment variables for the Open Notebook application, including:
  - `OPENAI_API_KEY`: Your OpenAI API key
  - `SURREAL_ADDRESS`: Address of the SurrealDB service
  - `SURREAL_PORT`: Port for SurrealDB
  - `SURREAL_USER`: Username for SurrealDB
  - `SURREAL_PASS`: Password for SurrealDB
  - `SURREAL_NAMESPACE`: Namespace for SurrealDB
  - `SURREAL_DATABASE`: Database name for SurrealDB

## Accessing the Application

After installation, you can access the Open Notebook application by forwarding the service port:

```bash
kubectl port-forward svc/open-notebook 8080:8502
```

Then, navigate to `http://localhost:8080` in your web browser.

## Uninstallation

To uninstall the chart, run:

```bash
helm uninstall open-notebook
```

## License

This project is licensed under the MIT License. See the LICENSE file for details.