#
#
# ca-wstation (caws)

default[:ca-wstation][:needed_packages] = %w{ mc yum-utils pv }

case platform
when "redhat","centos","scientific"
  if node[:platform_version].to_f >= 6 then
	set[:ca-wstation][:needed_packages] << "genisoimage"
  else
	set[:ca-wstation][:needed_packages] << "mkisofs"
  end
end
