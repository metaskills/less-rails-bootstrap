#!/bin/bash

bs_dir='./twitter/bootstrap'
lrb_dir='.'
lrb_img_dir="$lrb_dir/app/assets/images/twitter/bootstrap"
lrb_js_dir="$lrb_dir/app/assets/javascripts/twitter/bootstrap"
lrb_styles_dir="$lrb_dir/app/assets/stylesheets/twitter"
lrb_fw_dir="$lrb_dir/app/frameworks/twitter/bootstrap"

error() {
echo -e "\e[1;31m"$1"\e[0m"
}

success() {
echo -e "\e[1;32m"$1"\e[0m"
}

info() {
echo -e "\e[1;34m"$1"\e[0m"
}

if [ $# -ne 1 ] 
then
error "USAGE: $0 <bootstrap version>"
exit 1
fi

if [ ! -d $bs_dir ]; then
    info "Bootstrap not found. Cloning to twitter/bootstrap..."
    git clone --quiet git://github.com/twbs/bootstrap.git twitter/bootstrap
fi

cd twitter/bootstrap
info "Using $1..."
git checkout --quiet $1
cd ../../

info "Copying icon fonts..."
# images
for f in $bs_dir/img/*; do
    bn=$(basename $f)
    cp $f $lrb_img_dir/$bn
done

info "Copying scripts..."
# scripts
for f in $bs_dir/js/*.js; do
    bn=$(basename $f)
    cp $f $lrb_js_dir/${bn/bootstrap-/}
done

info "Copying styles..."
# styles
for f in $bs_dir/less/*.less; do
    bn=$(basename $f)
    sed -e 's#"\.\./img/\([^"]*\)"#"twitter/bootstrap/\1"#g' \
        -e 's#background-image: url(#background-image: asset-url(#g' \
        $f > $lrb_fw_dir/$bn
done

success "Done"
