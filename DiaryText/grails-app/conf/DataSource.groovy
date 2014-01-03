dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    username = "root"
    password = "root"
    properties {
        maxActive = 50
        maxIdle = 25
        minIdle = 5
        initialSize = 5
        minEvictableIdleTimeMillis = 60000
        timeBetweenEvictionRunsMillis = 60000
        maxWait = 10000
        validationQuery = "/* PING */ SELECT 1"
        // testOnBorrow=true
        testOnReturn=true
        testWhileIdle=true
        numTestsPerEvictionRun=3
    }
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
    jdbc.batch_size=1000
    flush.mode='commit'
    //hibernate.show_sql = true
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://192.168.1.120:3306/diary_text?useUnicode=true&characterEncoding=UTF-8"
//            url = "jdbc:mysql://192.168.1.198:3306/eopoosp?useUnicode=true&characterEncoding=UTF-8"
            //url="jdbc:hsqldb:mem:devDb"
        }
    }
    test {
        dataSource {
            //username = "sa"
            //password = ""
            dbCreate = "update"
            //url = "jdbc:hsqldb:mem:testDb"
            url = "jdbc:mysql://192.168.1.120:3306/test?useUnicode=true&characterEncoding=UTF-8"
//            url = "jdbc:mysql://192.1
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://192.168.1.120:3306/diary_text?useUnicode=true&characterEncoding=UTF-8"
//            url = "jdbc:mysql://192.168.1.198:3306/eopoosp?useUnicode=true&characterEncoding=UTF-8"
        }
    }
}
