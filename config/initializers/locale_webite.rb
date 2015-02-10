if Rails.env.development?
  APP_LOCALE_WEBSITE = 
  {
    de: "http://de.remailderdev.com:4000",
    es: "http://es.remailderdev.com:4000",
    fr: "http://fr.remailderdev.com:4000",
    en: "http://en.remailderdev.com:4000",
    cn: "http://cn.remailderdev.com:4000"
  }

elsif Rails.env.staging?
  APP_LOCALE_WEBSITE = 
  {
    de: "http://de.dolphin-146390.apse1.nitrousbox.com",
    es: "http://es.dolphin-146390.apse1.nitrousbox.com",
    fr: "http://fr.dolphin-146390.apse1.nitrousbox.com",
    en: "http://en.dolphin-146390.apse1.nitrousbox.com",
    cn: "http://cn.dolphin-146390.apse1.nitrousbox.com"
  }
else
  APP_LOCALE_WEBSITE = 
  {
    de: "http://de.remailder.com",
    es: "http://es.remailder.com",
    fr: "http://fr.remailder.com",
    en: "http://en.remailder.com",
    cn: "http://cn.remailder.com"
  }
end