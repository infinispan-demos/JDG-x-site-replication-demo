install-templates:
	oc create -f jdg-x-site-replication-template.yml || true
	oc replace -f jdg-x-site-replication-template.yml || true
.PHONY: install-templates

clear:
	oc delete all,secrets,sa,templates,configmaps,daemonsets,clusterroles,rolebindings,serviceaccounts --selector=template=jdg || true
.PHONY: clear

test:
	oc process jdg | oc create -f -
.PHONY: test
