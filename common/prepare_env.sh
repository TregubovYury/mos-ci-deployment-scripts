- job:
    builders:
      - shell:
          !include-raw 'scripts/prepare_env.sh'
    concurrent: true
    description: |
      Creates a python virtual environment for system tests. Stores additional images.<br><br>
    logrotate:
      daysToKeep: 14
    name: new_prepare_env
    parameters:
      - bool:
          name: 'update_release_6_1'
          default: false
      - bool:
          name: 'update_release_7_0'
          default: false
      - bool:
          name: 'update_release_8_0'
          default: false
      - bool:
          name: 'update_release_master'
          default: true
      - bool:
          name: 'download_images'
          default: false
      - node:
          name: NODE
          allowed-multiselect: true
      - text:
          name: VENV_REQUIREMENTS
          default: ''
          description: 'Use custom requirements for venv'
      - string:
          name: CLOUD_FEDORA
          default: 'magnet:?xt=urn:btih:edf7287187fe35e94aaa6cf973c04fbc6700433f&dn=cloud-fedora.qcow2&tr=http%3A%2F%2Ftracker01-bud.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-scc.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-msk.infra.mirantis.net%3A8080%2Fannounce&ws=http%3A%2F%2Fsrv07-srt.srt.mirantis.net%2Fcloud-images%2Fcloud-fedora.qcow2&ws=http%3A%2F%2Fsrv08-srt.srt.mirantis.net%2Fcloud-images%2Fcloud-fedora.qcow2&ws=http%3A%2F%2Fsrv11-msk.msk.mirantis.net%2Fcloud-images%2Fcloud-fedora.qcow2'
      - string:
          name: SAVANNA_IMAGE
          default: 'magnet:?xt=urn:btih:e94b9329993230e7d448767ce96acb6048643a2e&dn=savanna-0.3-vanilla-1.2.1-ubuntu-13.04.qcow2&tr=http%3A%2F%2Ftracker01-bud.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-scc.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-msk.infra.mirantis.net%3A8080%2Fannounce&ws=http%3A%2F%2Fsrv07-srt.srt.mirantis.net%2Fcloud-images%2Fsavanna-0.3-vanilla-1.2.1-ubuntu-13.04.qcow2&ws=http%3A%2F%2Fsrv08-srt.srt.mirantis.net%2Fcloud-images%2Fsavanna-0.3-vanilla-1.2.1-ubuntu-13.04.qcow2&ws=http%3A%2F%2Fsrv11-msk.msk.mirantis.net%2Fcloud-images%2Fsavanna-0.3-vanilla-1.2.1-ubuntu-13.04.qcow2'
          description: ''
      - string:
          name: F17_IMAGE
          default: 'magnet:?xt=urn:btih:e116e33c89c8cfa4ab6c00b126c8a1b7c4632a94&dn=F17-x86%5F64-cfntools.qcow2&tr=http%3A%2F%2Ftracker01-bud.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-scc.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-msk.infra.mirantis.net%3A8080%2Fannounce&ws=http%3A%2F%2Fsrv07-srt.srt.mirantis.net%2Fcloud-images%2FF17-x86%5F64-cfntools.qcow2&ws=http%3A%2F%2Fsrv08-srt.srt.mirantis.net%2Fcloud-images%2FF17-x86%5F64-cfntools.qcow2&ws=http%3A%2F%2Fsrv11-msk.msk.mirantis.net%2Fcloud-images%2FF17-x86%5F64-cfntools.qcow2'
      - string:
          name: MURANO_IMAGE
          default: 'magnet:?xt=urn:btih:958fdb29989853ec74a84940558dd3d84bff91b6&dn=ubuntu%5F14%5F04-murano-agent%5Fstable%5Fjuno.qcow2&tr=http%3A%2F%2Ftracker01-bud.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-scc.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-msk.infra.mirantis.net%3A8080%2Fannounce&ws=http%3A%2F%2Ffuel-storage.srt.mirantis.net%2Fcloud-images%2Fubuntu%5F14%5F04-murano-agent%5Fstable%5Fjuno.qcow2'
          description: 'Image for Murano tests'
      - string:
          name: MURANO_IMAGE_26_02_15
          default: 'magnet:?xt=urn:btih:2dc0bae9f53fc5216126d2b9a2a2450da60055f7&dn=ubuntu%5F14%5F04-murano-agent%5Fstable%5Fjuno%5F26%5F02%5F15.qcow2&tr=http%3A%2F%2Ftracker01-bud.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-scc.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-msk.infra.mirantis.net%3A8080%2Fannounce&ws=http%3A%2F%2Ffuel-storage.srt.mirantis.net%2Fcloud-images%2Fubuntu%5F14%5F04-murano-agent%5Fstable%5Fjuno%5F26%5F02%5F15.qcow2'
      - string:
          name: SAHARA_JUNO_HDP
          default: 'magnet:?xt=urn:btih:9fce644f8ac249f357ee35630724fcc850091c37&dn=sahara-juno-hdp-2.0.6-centos-6.5.qcow2&tr=http%3A%2F%2Ftracker01-bud.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-scc.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-msk.infra.mirantis.net%3A8080%2Fannounce&ws=http%3A%2F%2Ffuel-storage.srt.mirantis.net%2Fcloud-images%2Fsahara-juno-hdp-2.0.6-centos-6.5.qcow2'
          description: 'https://bugs.launchpad.net/fuel/+bug/1413183'
      - string:
          name: SAHARA_JUNO_VANILLA
          default: 'magnet:?xt=urn:btih:02b1c9666009c793d06655d61de3d8dd85ca7118&dn=sahara-juno-vanilla-2.4.1-ubuntu-14.04.qcow2&tr=http%3A%2F%2Ftracker01-bud.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-scc.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-msk.infra.mirantis.net%3A8080%2Fannounce&ws=http%3A%2F%2Ffuel-storage.srt.mirantis.net%2Fcloud-images%2Fsahara-juno-vanilla-2.4.1-ubuntu-14.04.qcow2'
          description: 'https://bugs.launchpad.net/fuel/+bug/1413183'
      - string:
          name: SAHARA_KILO_VANILLA
          default: 'magnet:?xt=urn:btih:5aea5e797c507fea259a0d85f4523769c5b8fbb8&dn=sahara-kilo-vanilla-2.6-ubuntu-14.04.qcow2&tr=http%3A%2F%2Ftracker01-bud.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-scc.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-msk.infra.mirantis.net%3A8080%2Fannounce&ws=http%3A%2F%2Ffuel-storage.srt.mirantis.net%2Fcloud-images%2Fsahara-kilo-vanilla-2.6-ubuntu-14.04.qcow2'
          description: 'https://bugs.launchpad.net/fuel/+bug/1477525'
      - string:
          name: SAHARA_LIBERTY_VANILLA
          default: 'magnet:?xt=urn:btih:5b7a8d882a4e8b9f0e58bcf5c4444eeca50853a1&dn=sahara-liberty-vanilla-2.7.1-ubuntu-14.04.qcow2&tr=http%3A%2F%2Ftracker01-bud.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-scc.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-msk.infra.mirantis.net%3A8080%2Fannounce&ws=http%3A%2F%2Fvault.infra.mirantis.net%2Fsahara-liberty-vanilla-2.7.1-ubuntu-14.04.qcow2'
          description: 'https://bugs.launchpad.net/fuel/+bug/1519757'
      - string:
          name: QA_CENTOS_COMPUTE
          default: 'magnet:?xt=urn:btih:41e6b045115e7a8d61e4f6b844859034a1f8d0a8&dn=centos7%5Fdevops%5F04022016.qcow2&tr=http%3A%2F%2Ftracker01-bud.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-scc.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-msk.infra.mirantis.net%3A8080%2Fannounce&ws=http%3A%2F%2Fvault.infra.mirantis.net%2Fcentos7%5Fdevops%5F04022016.qcow2'
          description: 'https://bugs.launchpad.net/fuel/+bug/1522446'
      - string:
          name: QA_RHEL_COMPUTE
          default: 'magnet:?xt=urn:btih:d079dd9f4872a3a063a2324c4dced153f0a7aea4&dn=rhel7%5F04022016.qcow2&tr=http%3A%2F%2Ftracker01-bud.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-scc.infra.mirantis.net%3A8080%2Fannounce&tr=http%3A%2F%2Ftracker01-msk.infra.mirantis.net%3A8080%2Fannounce&ws=http%3A%2F%2Fvault.infra.mirantis.net%2Frhel7%5F04022016.qcow2'
          description: 'https://bugs.launchpad.net/fuel/+bug/1522446'
    publishers:
      - email:
          notify-every-unstable-build: false
          recipients: 'ci+alert@mirantis.com'
    wrappers:
      - timeout:
          timeout: 60