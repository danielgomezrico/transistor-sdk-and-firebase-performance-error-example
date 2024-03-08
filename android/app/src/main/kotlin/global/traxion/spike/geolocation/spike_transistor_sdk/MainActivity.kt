package global.traxion.spike.geolocation.spike_transistor_sdk
import android.os.Bundle
import android.os.Handler
import io.flutter.embedding.android.FlutterActivity
import okhttp3.*

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        Handler().postDelayed({
            Thread(Runnable {
                val client = OkHttpClient()

                val request = Request.Builder()
                        .url("http://myserver.com/gps/fake")
                        .build()

                val response = client.newCall(request).execute()
            }).start()
        }, 5000)
    }
}
