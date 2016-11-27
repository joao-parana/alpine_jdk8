# alpine_jdk8

> ATENÇÃO: Este contêiner foi criado com o propósito de usar no Eclipse Che quando estivermos criando Stack para projetos Java

Exemplo de definição de Stack no Eclipse Che usando este contêiner/imagem.

```json
{
  "source": {
    "origin": "parana/alpine_jdk8",
    "type": "image"
  },
  "scope": "general",
  "description": "Default Java Stack with JDK 8 and Maven on Alpine Linux",
  "workspaceConfig": {
    "environments": {
      "default": {
        "machines": {
          "dev-machine": {
            "agents": [
              "org.eclipse.che.terminal",
              "org.eclipse.che.ws-agent",
              "org.eclipse.che.ssh"
            ],
            "servers": {},
            "attributes": {
              "memoryLimitBytes": "2147483648"
            }
          }
        },
        "recipe": {
          "location": "parana/alpine_jdk8",
          "type": "dockerimage"
        }
      }
    },
    "commands": [
      {
        "commandLine": "mvn clean install -f ${current.project.path}",
        "name": "build",
        "type": "mvn",
        "attributes": {}
      }
    ],
    "projects": [],
    "defaultEnv": "default",
    "name": "default",
    "links": []
  },
  "components": [
    {
      "version": "1.8.0_92-b14",
      "name": "JDK"
    },
    {
      "version": "3.3.9",
      "name": "Maven"
    }
  ],
  "tags": [
    "Java",
    "JDK",
    "Maven",
    "Subversion",
    "Git",
    "alpine"
  ],
  "creator": "ide",
  "name": "Java8",
  "id": "java-default"
}
```
