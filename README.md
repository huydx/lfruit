=======
# Lfruit

![img](https://i.gyazo.com/47a05233d45a1a2f4d2d0db6b8f67ec2.png)

Lets say: you want a crawler which you can say to it
> *I have a web site url.com, let's go crawl and download for me every pdf file url.com, and sites that link to url.com have*

*Lfruit* is that tool for you. You can specify whatever file format you want

![img](https://i.gyazo.com/3075830314743b85e0b9a0853162810a.gif)

### When lfruit is useful

- You want to download every pdf lectures from university professor's website
- You want to download every gif files of an url
- You want to download every mp3 file of a music website

## Installation & Usage

Just
```ruby
gem install 'lfruit'
```

And then execute:

```
  $ lfruit --url=yoururl.com
           --pattern=(your include regex)
           --exclude_pattern=(your pattern that you dont want to download)
           --location=(folder you want to download)
           --parallel_num=(how much threaded you want to use)
           --limit=(how many times your crawler will run)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/lfruit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
