## Project Commit & Branching Ruleset

#### Definition of Done:

* Acceptance criteria are fulfilled
* Created widgets, units and integration tests
* Format and test pipelines run successfully

### Branches

*The `< >` notation indicates that there is a placeholder for an actual value or expression.*

` { feature | bugfix | hotfix | task }/#<Issue Number>_<TICKET_NAME> `

#### Examples:

`feature/#35_create_user_service`

`bugfix/#190_remove_faulty_header`

`task/#333_expand_statistics_service_tests`

### Commits

```
#<Issue Number> - <type>(optional scope): <description>

<commit details> Explain why, something was done
 ```

#### Examples:

```
#99 - refactor(dependencies): update insecure libraries

Updated project dependencies to the latest versions to address security vulnerabilities and improve performance.
```