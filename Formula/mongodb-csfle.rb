class MongodbCsfle < Formula
  desc "MongoDB csfle shared library for Client Side Encryption"
  homepage "https://www.mongodb.com/"

  license "MongoDB Customer Agreement"

  if Hardware::CPU.arm?
    url "https://downloads.mongodb.com/osx/mongo_crypt_shared_v1-macos-arm64-enterprise-6.0.6.tgz"
    sha256 "9370d83bfd44e8e622ec5de764c9ba61c7be576a4fa6797af3760c398663c8a7"
  else
    url "https://downloads.mongodb.com/osx/mongo_crypt_shared_v1-macos-x86_64-enterprise-6.0.6.tgz"
    sha256 "4edcd94eac2a420701e1514314a260267d5d54b0ef4b1d7a69abf6ab8ffd0342"
  end


  def caveats
    <<~EOS
      The MongoDB csfle shared library is licensed under the MongoDB Customer Agreement (https://www.mongodb.com/customer-agreement). Except for evaluation purposes, you may not use mongocryptd without a commercial license from MongoDB.
    EOS
  end

  def install
    prefix.install Dir["*"]
  end

  test do
    system "otool", "-L", "#{lib}/mongo_csfle_v1.dylib"
  end
end
