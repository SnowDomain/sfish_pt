# This script was automatically generated from the dsa-965
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(22831);
 script_version("$Revision: 1.6 $");
 script_xref(name: "DSA", value: "965");
 script_cve_id("CVE-2005-3732");
 script_bugtraq_id(15523);

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-965 security update');
 script_set_attribute(attribute: 'description', value:
'The Internet Key Exchange version 1 (IKEv1) implementation in racoon
from ipsec-tools, IPsec tools for Linux, try to dereference a NULL
pointer under certain conditions which allows a remote attacker to
cause a denial of service.
The old stable distribution (woody) does not contain ipsec-tools.
For the stable distribution (sarge) this problem has been fixed in
version 0.5.2-1sarge1.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2006/dsa-965');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your racoon package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:C');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA965] DSA-965-1 ipsec-tools");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-965-1 ipsec-tools");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'ipsec-tools', release: '3.1', reference: '0.5.2-1sarge1');
deb_check(prefix: 'racoon', release: '3.1', reference: '0.5.2-1sarge1');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
