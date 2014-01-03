import java.security.MessageDigest
/**
 * Created with IntelliJ IDEA.
 * User: xpyan
 * Date: 14-1-3
 * Time: 下午1:59
 * To change this template use File | Settings | File Templates.
 */

class SHACodec {
    static encode = {target->
        MessageDigest md = MessageDigest.getInstance('SHA')
        md.update(target.getBytes('UTF-8'))
        return new String(md.digest()).encodeAsBase64()
    }
}
