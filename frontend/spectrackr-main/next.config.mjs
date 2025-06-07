/** @type {import('next').NextConfig} */
const nextConfig = {
  transpilePackages: ['three'],
  eslint: {
    ignoreDuringBuilds: true,
  },
  typescript: {
    ignoreBuildErrors: true,
  },
  images: {
    unoptimized: true,
  },
}

export default nextConfig
