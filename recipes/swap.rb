script 'create swapfile' do
  interpreter 'bash'
  not_if { File.exists?('/var/swapfile') }
  code <<-eof
    mem_size=$(free -b | grep "Mem:" | awk '{print $2}') &&
    dd if=/dev/zero of=/var/swapfile bs=1M count=$((${mem_size}/2/1024/1024)) &&
    chmod 600 /var/swapfile &&
    mkswap /var/swapfile
  eof
end

mount '/dev/null' do  # swap file entry for fstab
  action :enable  # cannot mount; only add to fstab
  device '/var/swapfile'
  fstype 'swap'
end

script 'activate swap' do
  interpreter 'bash'
  code 'swapon -a'
end
