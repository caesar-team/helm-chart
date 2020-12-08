#!/bin/env sh
helm install -f values.yml --debug --dry-run --namespace=local-caesar local ./stable/caesar-web-client > result/result.yaml