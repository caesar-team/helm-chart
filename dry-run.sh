#!/bin/env sh
helm install -f values.yml --debug --dry-run --namespace=default-caeasar-team test-caesar-team ./stable/caesar-server > result/result.yaml