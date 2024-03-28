# Puppet manifest to install Flask version 2.1.0 using pip3

# Explanation of the Puppet script
# This manifest installs Flask version 2.1.0 using pip3

# Ensure the package 'flask' is installed and at version 2.1.0
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
