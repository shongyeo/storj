module storj.io/storj

// force specific versions for minio
require (
	github.com/btcsuite/btcutil v0.0.0-20180706230648-ab6388e0c60a
	github.com/garyburd/redigo v1.0.1-0.20170216214944-0d253a66e6e1 // indirect
	github.com/go-ole/go-ole v1.2.1 // indirect
	github.com/graphql-go/graphql v0.7.6
	github.com/hanwen/go-fuse v0.0.0-20181027161220-c029b69a13a7
	github.com/inconshreveable/mousetrap v1.0.0 // indirect
	github.com/mattn/go-colorable v0.0.9 // indirect

	github.com/minio/minio v0.0.0-20180508161510-54cd29b51c38
	github.com/mitchellh/mapstructure v1.1.1 // indirect

	github.com/prometheus/client_golang v0.9.0-pre1.0.20180416233856-82f5ff156b29 // indirect
	github.com/segmentio/go-prompt v1.2.1-0.20161017233205-f0d19b6901ad // indirect
)

exclude gopkg.in/olivere/elastic.v5 v5.0.72 // buggy import, see https://github.com/olivere/elastic/pull/869

require (
	github.com/BurntSushi/toml v0.3.1 // indirect
	github.com/Shopify/toxiproxy v2.1.3+incompatible // indirect
	github.com/StackExchange/wmi v0.0.0-20180725035823-b12b22c5341f // indirect
	github.com/alicebob/gopher-json v0.0.0-20180125190556-5a6b3ba71ee6 // indirect
	github.com/alicebob/miniredis v0.0.0-20180911162847-3657542c8629
	github.com/armon/go-metrics v0.0.0-20180917152333-f0300d1749da // indirect
	github.com/boltdb/bolt v1.3.1
	github.com/cheggaaa/pb v1.0.5-0.20160713104425-73ae1d68fe0b
	github.com/dgrijalva/jwt-go v3.2.0+incompatible // indirect
	github.com/djherbis/atime v1.0.0 // indirect
	github.com/dustin/go-humanize v0.0.0-20180713052910-9f541cc9db5d // indirect
	github.com/eapache/go-resiliency v1.1.0 // indirect
	github.com/eapache/go-xerial-snappy v0.0.0-20180814174437-776d5712da21 // indirect
	github.com/eapache/queue v1.1.0 // indirect
	github.com/eclipse/paho.mqtt.golang v1.1.1 // indirect
	github.com/elazarl/go-bindata-assetfs v1.0.0 // indirect
	github.com/fatih/color v1.7.0 // indirect
	github.com/fatih/structs v1.0.0 // indirect
	github.com/go-redis/redis v6.14.1+incompatible
	github.com/gogo/protobuf v1.1.1
	github.com/golang-migrate/migrate/v3 v3.5.2
	github.com/golang/mock v1.1.1
	github.com/golang/protobuf v1.2.0
	github.com/gomodule/redigo v2.0.0+incompatible // indirect
	github.com/google/go-cmp v0.2.0
	github.com/gorilla/handlers v1.4.0 // indirect
	github.com/gorilla/rpc v1.1.0 // indirect
	github.com/gtank/cryptopasta v0.0.0-20170601214702-1f550f6f2f69
	github.com/hashicorp/go-immutable-radix v1.0.0 // indirect
	github.com/hashicorp/go-msgpack v0.0.0-20150518234257-fa3f63826f7c // indirect
	github.com/hashicorp/raft v1.0.0 // indirect
	github.com/howeyc/gopass v0.0.0-20170109162249-bf9dde6d0d2c // indirect
	github.com/inconshreveable/go-update v0.0.0-20160112193335-8152e7eb6ccf // indirect
	github.com/jbenet/go-base58 v0.0.0-20150317085156-6237cf65f3a6
	github.com/jtolds/monkit-hw v0.0.0-20180827162413-5a254051f35d
	github.com/klauspost/cpuid v0.0.0-20180405133222-e7e905edc00e // indirect
	github.com/klauspost/reedsolomon v0.0.0-20180704173009-925cb01d6510 // indirect
	github.com/lib/pq v1.0.0
	github.com/loov/hrtime v0.0.0-20180911122900-a9e82bc6c180
	github.com/loov/plot v0.0.0-20180510142208-e59891ae1271
	github.com/mailru/easyjson v0.0.0-20180823135443-60711f1a8329 // indirect
	github.com/mattn/go-isatty v0.0.4 // indirect
	github.com/mattn/go-runewidth v0.0.3 // indirect
	github.com/mattn/go-sqlite3 v1.9.0
	github.com/minio/cli v1.3.0
	github.com/minio/dsync v0.0.0-20180124070302-439a0961af70 // indirect
	github.com/minio/highwayhash v0.0.0-20180501080913-85fc8a2dacad // indirect
	github.com/minio/lsync v0.0.0-20180328070428-f332c3883f63 // indirect
	github.com/minio/mc v0.0.0-20180926130011-a215fbb71884 // indirect
	github.com/minio/minio-go v6.0.3+incompatible
	github.com/minio/sha256-simd v0.0.0-20171213220625-ad98a36ba0da // indirect
	github.com/minio/sio v0.0.0-20180327104954-6a41828a60f0 // indirect
	github.com/mitchellh/go-homedir v0.0.0-20180801233206-58046073cbff // indirect
	github.com/mr-tron/base58 v0.0.0-20180922112544-9ad991d48a42
	github.com/nats-io/gnatsd v1.3.0 // indirect
	github.com/nats-io/go-nats v1.6.0 // indirect
	github.com/nats-io/go-nats-streaming v0.4.0 // indirect
	github.com/nats-io/nats v1.6.0 // indirect
	github.com/nats-io/nats-streaming-server v0.11.0 // indirect
	github.com/nats-io/nuid v1.0.0 // indirect
	github.com/pascaldekloe/goe v0.0.0-20180627143212-57f6aae5913c // indirect
	github.com/pierrec/lz4 v2.0.5+incompatible // indirect
	github.com/pkg/profile v1.2.1 // indirect
	github.com/rcrowley/go-metrics v0.0.0-20180503174638-e2704e165165 // indirect
	github.com/rs/cors v1.5.0 // indirect
	github.com/shirou/gopsutil v2.17.12+incompatible
	github.com/skyrings/skyring-common v0.0.0-20160929130248-d1c0bb1cbd5e
	github.com/spacemonkeygo/errors v0.0.0-20171212215202-9064522e9fd1 // indirect
	github.com/spf13/cobra v0.0.3
	github.com/spf13/pflag v1.0.3
	github.com/spf13/viper v1.2.1
	github.com/streadway/amqp v0.0.0-20180806233856-70e15c650864 // indirect
	github.com/stretchr/testify v1.2.2
	github.com/tidwall/gjson v1.1.3 // indirect
	github.com/tidwall/match v0.0.0-20171002075945-1731857f09b1 // indirect
	github.com/vivint/infectious v0.0.0-20180906161625-e155e6eb3575
	github.com/yuin/gopher-lua v0.0.0-20180918061612-799fa34954fb // indirect
	github.com/zeebo/admission v0.0.0-20180821192747-f24f2a94a40c
	github.com/zeebo/errs v1.0.0
	github.com/zeebo/float16 v0.1.0 // indirect
	github.com/zeebo/incenc v0.0.0-20180505221441-0d92902eec54 // indirect
	go.uber.org/atomic v1.3.2 // indirect
	go.uber.org/multierr v1.1.0 // indirect
	go.uber.org/zap v1.9.1
	golang.org/x/crypto v0.0.0-20181009213950-7c1a557ab941
	golang.org/x/net v0.0.0-20181003013248-f5e5bdd77824
	golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f
	golang.org/x/sys v0.0.0-20181011152604-fa43e7bc11ba
	golang.org/x/time v0.0.0-20180412165947-fbb02b2291d2 // indirect
	google.golang.org/grpc v1.15.0
	gopkg.in/Shopify/sarama.v1 v1.18.0 // indirect
	gopkg.in/cheggaaa/pb.v1 v1.0.25 // indirect
	gopkg.in/olivere/elastic.v5 v5.0.76 // indirect
	gopkg.in/spacemonkeygo/monkit.v2 v2.0.0-20180827161543-6ebf5a752f9b
	gopkg.in/vmihailenco/msgpack.v2 v2.9.1 // indirect
)
