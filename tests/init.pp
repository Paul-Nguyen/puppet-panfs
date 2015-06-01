# Tests are run by using puppet apply --noop (to check for compilation errors
# and view a log of events) or by fully applying the test (to compare the
# resulting system state to the desired state).
#
# Learn more about module testing here:
#  - http://docs.puppetlabs.com/guides/tests_smoke.html
#
class { 'panfs':
    gateway => 'panfs.gateway.example.com'
}
