# CA workstation
# CAws
# ca-wstation (caws)


default[:ca-wstation][:needed_packages] = []


case platform

when "redhat","centos","scientific"
  
  # Some utilities and tools I want to have
  default[:centos_packages] = %w{ yum-utils mc pv createrepo dstat htop iotop iftop vnstat tree }

  # [CentOS-5.x]
  # Dev Tools Group (mandatory set):
  #	yum-utils mc pv autoconf automake binutils bison flex gcc gcc-c++ gettext libtool make pkgconfig redhat-rpm-config rpm-build gdb strace
  # Mkisofs tool:
  #	mkisofs

  # [CentOS-6.x]
  # Dev Tools Group (mandatory set):
  #	yum-utils mc pv autoconf automake binutils bison flex gcc gcc-c++ gettext libtool make pkgconfig redhat-rpm-config rpm-build patch
  # Mkisofs tools:
  #	genisoimage
  
  # Development Tools Group (mandatory set)
  default[:centos_packages] += %w{ autoconf automake binutils bison flex gcc gcc-c++ gettext libtool make pkgconfig redhat-rpm-config rpm-build }
  
  # Package differences between CentOS branches, install mkisofs tool and yum-downloadonly plugin also
  if node[:platform_version].to_f >= 6 then
	default[:centos_packages] += %w{ patch genisoimage yum-plugin-downloadonly }
  else
	default[:centot_packages] += %w{ gdb strace mkisofs yum-downloadonly }
  end

  default[:ca-wstation][:needed_packages] = default[:centos_packages]

end

