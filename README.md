# CS F212 Database Systems Project

- [CS F212 Database Systems Project](#cs-f212-database-systems-project)
- [Getting started](#getting-started)
  - [Docker](#docker)
  - [VS Code](#vs-code)
  - [Optional](#optional)
- [Other commands](#other-commands)
- [Connecting with other tools](#connecting-with-other-tools)
- [Current workflow](#current-workflow)
- [Debugging](#debugging)
- [References](#references)

# Getting started

## Docker

*   Install docker as per your operating system. [Link to docker docs](https://docs.docker.com/engine/install/ubuntu/#installation-methods).

    > **Note**
    > Make sure you follow the [post installation instructions](https://docs.docker.com/engine/install/linux-postinstall/) or similar [posts](https://www.digitalocean.com/community/questions/how-to-fix-docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket).

*   Clone the repo. All the compose related commands are supposed to be run from the root directory of the project (i.e., `cd the-folder-you-just-cloned`).

*   To start the database run the following command. Make sure you have enough data(~3 GB) and storage(~10 GB) when you are running this the first time.

    ```bash
    docker compose up
    ```

*   Similarly you can either use <kbd>Ctrl</kbd> + <kbd>C</kbd> to stop only the container or see below to completely remove the containers and networks after use.

    ```bash
    docker compose down
    ```

## VS Code

*   [Install VS Code Oracle Developer Tools extension.](https://marketplace.visualstudio.com/items?itemName=Oracle.oracledevtools)

*   In the command palette look for `Oracle SQL Formatter Settings` and import the `oracle-formatter-settings.json` file and save for consistent formatting.

*   Refer  [connecting with other tools](#connecting-with-other-tools) to connect the extension with the database.

## Optional

*   Run `yarn` in the root directory to install `remark` for markdown formatting.
*   Install `rlwrap` (linux) using your package manager. While starting sqlplus execute it as below this way you can use sqlplus prompt similar to that of a normal terminal (Arrow keys to get previous command etc.,).

    ```bash
    # Those flags are to make it work with docker.
    rlwrap -a -N docker exec -it oracle-sql-db sqlplus / as sysdba
    ```

# Other commands

These are a very few select commands. For more information you can always visit the docs linked in the [references](#references).

*   To start sqlplus in the running container.

    ```bash
    docker exec -it oracle-sql-db sqlplus / as sysdba
    ```

    ```sql
    -- Run inside sqlplus to use a different user
    connect c##project_dba/password;
    ```

    > **Note**
    > You will still face the same problems that you face in lab while using sqlplus which you can get around by using `rlwrap`. Check [optional](#optional) for instructions.

*   To reset the database to the initial state.

    ```bash
    docker compose down -v
    ```

*   To remove everything (images, containers, volumes, networks)

    ```bash
    docker system prune -af --volumes
    ```

    > **Warning**
    > You will have to re-download the image again the next time you run `docker compose up` after running the above command.

*   To access tables from other users

    ```sql
    -- Connect as a customer/manager
    connect c##aadhar_id/password;
    -- Replace users with any other table
    select * from c##project_dba.users;
    ```

# Connecting with other tools

You can use [DBeaver](https://dbeaver.io/download/) or the Oracle VS Code extension to connect to the database with the following details.

*   Host: localhost
*   Port: 1521
*   Service: XE
*   Username: sys
*   Role: sysdba
*   Password: P@ssword9

# Current workflow

`./startup` folder will have the sql files which run every time the database is started. Since they run every time they always throw some errors which I think we can safely ignore for now. So we will be creating similar files grouping them by the job they do.

# Debugging

*   Check for missing semicolons.
*   Check for spelling mistakes.
*   Check if the data types are same.
*   Try running the same query in sqlplus and use `show err;` to see the errors.

# References

*   [Oracle database container repository.](https://container-registry.oracle.com/ords/f?p=113:4:5505774220922:::4:P4_REPOSITORY,AI_REPOSITORY,AI_REPOSITORY_NAME,P4_REPOSITORY_NAME,P4_EULA_ID,P4_BUSINESS_AREA_ID:803,803,Oracle%20Database%20Express%20Edition,Oracle%20Database%20Express%20Edition,1,0\&cs=3ovGLBhIPtwiUSX6-52Lmzy52i5dPCeiH1H6Imux_1gaEMSsq5Dokm-R-CcPzzUfJ8PvVl0xIyXDv8emwFyuBwA)
*   [Docker docs.](https://docs.docker.com/get-started/overview/)
*   [Oracle PL/SQL youtube playlist.](https://www.youtube.com/playlist?list=PLL_LQvNX4xKyiExzq9GKwORoH6nvaRnOQ)
