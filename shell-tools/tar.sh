#!/redbean/bin/env bash

find . -name "*.html" | xargs -d '\n' tar -cf test.tar
