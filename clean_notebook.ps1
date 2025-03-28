$input | python -c @"
import json, sys
nb = json.load(sys.stdin)
for cell in nb.get('cells', []):
    if 'execution_count' in cell:
        cell['execution_count'] = None
    if 'metadata' in cell:
        cell['metadata'].pop('execution', None)
json.dump(nb, sys.stdout, indent=1)
"@