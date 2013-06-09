#!/bin/bash

bs_dir='../twitter/bootstrap'
lrb_dir='.'
lrb_font_dir="$lrb_dir/vendor/assets/fonts/twitter/bootstrap"
lrb_js_dir="$lrb_dir/vendor/assets/javascripts/twitter/bootstrap"
lrb_styles_dir="$lrb_dir/vendor/assets/stylesheets/twitter"
lrb_fw_dir="$lrb_dir/vendor/frameworks/twitter/bootstrap"

if [ ! -d $bs_dir ]; then
    echo "Bootstrap not found. You might want to clone the bootstrap repo from http://twitter.github.com/bootstrap/ into $bs_dir"
    exit 1
fi

# fonts
mkdir -p $lrb_font_dir/
for f in $bs_dir/fonts/*; do
    bn=$(basename $f)
    cp $f $lrb_font_dir/$bn
done

# scripts
for f in $bs_dir/js/*.js; do
    bn=$(basename $f)
    cp $f $lrb_js_dir/${bn/bootstrap-/}
done

# styles
for f in $bs_dir/less/*.less; do
    bn=$(basename $f)
    sed -e "s/url('@{glyphicons-font-path}/asset-url('twitter\/bootstrap/g" \
        -e 's#background-image: url(#background-image: asset-url(#g' \
        $f > $lrb_fw_dir/$bn
done
