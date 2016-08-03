#
# Initialize boot2docker
#
function boot2docker_start() {
    local b2d_cmd='/usr/local/bin/boot2docker'
    local b2d_image='/usr/local/share/boot2docker/boot2docker.iso'
    local b2d_dir="$HOME/.boot2docker"

    unset DYLD_LIBRARY_PATH
    unset LD_LIBRARY_PATH
    mkdir -p "$b2d_dir"

    if [ ! -f "$b2d_dir/$(basename $b2d_image)" ]; then
        cp "$b2d_image" "$b2d_dir/"
    fi

    $b2d_cmd init
    $b2d_cmd up
    $($b2d_cmd shellinit)
}
