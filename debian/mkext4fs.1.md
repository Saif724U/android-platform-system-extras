% mkext4fs android-platform-system-extras | mkext4fs Manuals
% The Android Open Source Project

# NAME

mkext4fs - making ext4 file systems

# SYNOPSIS

mkext4fs [ -l <len> ] [ -j <journal size> ] [ -b <block_size> ]
    [ -g <blocks per group> ] [ -i <inodes> ] [ -I <inode size> ]
    [ -L <label> ] [ -f ] [ -a <android mountpoint> ] [ -u ]
    [ -S file_contexts ] [ -C fs_config ] [ -T timestamp ]
    [ -z | -s ] [ -w ] [ -c ] [ -J ] [ -v ] [ -B <block_list_file> ]
    [ -d <base_alloc_file_in> ] [ -D <base_alloc_file_out> ]
    <filename> [[<directory>] <target_out_directory>]

# DESCRIPTION

**mkext4fs** is a command line tool for make ext4 file systems

