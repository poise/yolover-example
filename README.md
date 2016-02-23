# YoloVer Example Repository

This (mono-)repository serves as an example for working with the [YoloVer workflow](https://yolover.poise.io).

This Chef repository will deploy Apache and PostgreSQL for a hypothetical
[Vandelay Industries](http://seinfeld.wikia.com/wiki/Vandelay_Industries).

## [Policies](/policies)

The major centerpiece of the repo are the Policyfiles.

* [`policies/_base.rb`](/policies/_base.rb) – Shared base policy for all servers.
  This applies the `chef-client` recipe to all nodes and sets the default sources
  used for all policies.
* [`polices/db.rb`](/policies/db.rb) – `db` policy to create a Postgres database
  server. This applies the `vandelay-postgres` recipe.
* [`policies/web.rb`](/policies/web.rb) – `web` policy to create an Apache web
  server. This applies the `vandelay-httpd` recipe.

### Policy Locks

Each policy has a corresponding lockfile.

* [`policies/db.lock.json`](policies/db.lock.json) – Lockfile for the `db` policy.
* [`policies/web.lock.json`](policies/web.lock.json) – Lockfile for the `web` policy.

## [Cookbooks](/cookbooks)

As this is at least in part a mono-repo layout, we have an old school `cookbooks/`
folder containing our local cookbooks.

* [`cookbooks/vandelay-httpd`](cookbooks/vandelay-httpd) – Wrapper cookbook
  around the [community `httpd` cookbook](https://supermarket.chef.io/cookbooks/httpd).
* [`cookbooks/vandelay-postgres`](cookbooks/vandelay-postgres) – Local cookbook
  to install PostgeSQL because we didn't want to use any of the community ones.

## [InSpec Tests](/test/integration)

To verify that our policies are correct, we use [InSpec
tests](https://github.com/chef/inspec).

* [`test/integration/db/db_spec.rb`](test/integration/db/db_spec.rb) – Tests
  for the `db` policy. Uses `psql` to confirm the database is operational.
* [`test/integration/web/web_spec.rb`](test/integration/web/web_spec.rb) – Tests
  for the `web` policy. Uses `curl` to confirm the content of index page.

## Other Files

* [`.kitchen.yml`](.kitchen.yml) – [Test Kitchen](https://kitchen.ci/)
  configuration for integration tests of the policies.

## Sponsors

Development sponsored by [Bloomberg](http://www.bloomberg.com/company/technology/).

## License

Copyright 2016, Noah Kantrowitz

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
