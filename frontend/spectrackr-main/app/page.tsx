"use client"

import type React from "react"
import { useRef } from "react"
import { Canvas, useFrame } from "@react-three/fiber"
import { OrbitControls } from "@react-three/drei"
import { Button } from "@/components/ui/button"
import { motion } from "framer-motion"
import { ChevronRight, Search, BarChart2, Briefcase, GraduationCap } from "lucide-react"
import { useRouter } from "next/navigation"
import * as THREE from "three"
import { ThemeProvider } from "@/components/theme-provider"
import { ThemeToggle } from "@/components/theme-toggle"

export default function Home() {
  return (
    <ThemeProvider attribute="class" defaultTheme="dark" enableSystem disableTransitionOnChange>
      <HomePage />
    </ThemeProvider>
  )
}

function HomePage() {
  const router = useRouter()

  return (
    <div className="relative min-h-screen bg-gradient-to-b from-slate-100 to-slate-200 dark:from-slate-900 dark:to-slate-800 text-slate-900 dark:text-white">
      {/* 3D Background - Fixed positioning and lower z-index */}
      <div className="fixed inset-0 z-0 opacity-30 dark:opacity-60">
        <Canvas camera={{ position: [0, 0, 5], fov: 75 }}>
          <ambientLight intensity={0.4} />
          <pointLight position={[10, 10, 10]} intensity={0.6} />
          <pointLight position={[-10, -10, -10]} intensity={0.3} />
          <Scene />
          <OrbitControls enableZoom={false} enablePan={false} enableRotate={false} />
        </Canvas>
      </div>

      {/* Content - Higher z-index to appear above 3D background */}
      <div className="relative z-10 min-h-screen">
        <div className="container mx-auto px-4 py-12">
          <header className="flex justify-between items-center py-6">
            <motion.div
              initial={{ opacity: 0, y: -20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.5 }}
              className="flex items-center gap-4"
            >
              <div className="flex items-center gap-2">
                <div className="bg-gradient-to-r from-cyan-500 to-blue-500 p-2 rounded-lg">
                  <BarChart2 className="h-6 w-6 text-white" />
                </div>
                <h1 className="text-2xl font-bold bg-gradient-to-r from-cyan-400 to-blue-500 bg-clip-text text-transparent">
                  SpecTrackr
                </h1>
              </div>
              <ThemeToggle />
            </motion.div>

            <motion.div
              initial={{ opacity: 0, y: -20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.5, delay: 0.2 }}
            >
              <Button
                onClick={() => { window.location.href = "http://localhost:3001" }}
                className="bg-gradient-to-r from-cyan-500 to-blue-500 hover:from-cyan-600 hover:to-blue-600 text-white shadow-lg"
              >
                시작하기 <ChevronRight className="ml-2 h-4 w-4" />
              </Button>
            </motion.div>
          </header>

          <main className="mt-20 md:mt-32">
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.7 }}
              className="max-w-4xl mx-auto text-center"
            >
            <h2 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6 leading-tight">
              의생명융합공학부{" "}
              <span className="block md:inline">
                학생들의{" "}
                <span className="bg-gradient-to-r from-cyan-400 to-blue-500 bg-clip-text text-transparent whitespace-nowrap">
                  진로 탐색
                </span>
              </span>{" "}
              을 위한 플랫폼
            </h2>


              <p className="text-lg md:text-xl text-slate-600 dark:text-slate-300 mb-8 max-w-3xl mx-auto">
                다양한 분야로의 진출 가능성을 연결하고, 채용 정보와 직무별 필수 역량을 한눈에 볼 수 있도록 지원합니다.
              </p>
            </motion.div>

            <motion.div
              initial={{ opacity: 0, y: 40 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.7, delay: 0.6 }}
              className="mt-24 md:mt-32 grid grid-cols-1 md:grid-cols-3 gap-8"
            >
              <FeatureCard
                icon={<Search className="h-8 w-8" />}
                title="직무 정보 통합"
                description="다양한 취업 사이트의 채용공고를 한 곳에서 확인하고 비교할 수 있습니다."
              />

              <FeatureCard
                icon={<Briefcase className="h-8 w-8" />}
                title="스펙 사례 제공"
                description="실제 합격자 자소서와 스펙 사례를 기반으로 현실적인 준비 방법을 제시합니다."
              />

              <FeatureCard
                icon={<GraduationCap className="h-8 w-8" />}
                title="맞춤형 탐색 기능"
                description="관심 직무 기반으로 필요한 역량과 준비 과정을 맞춤형으로 탐색할 수 있습니다."
              />
            </motion.div>

            <motion.div
              initial={{ opacity: 0, y: 40 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.7, delay: 0.9 }}
              className="mt-24 md:mt-32 text-center"
            >
              <div className="bg-white/90 dark:bg-slate-800/90 backdrop-blur-sm p-8 rounded-2xl border border-slate-200 dark:border-slate-700 shadow-xl max-w-4xl mx-auto">
                <h3 className="text-2xl md:text-3xl font-bold mb-6">
                  "폭넓은 가능성 속에서, 각자의 길을 찾고 준비할 수 있도록 함께합니다."
                </h3>

                <Button
                  onClick={() => { window.location.href = "http://localhost:3001" }}
                  size="lg"
                  className="mt-8 bg-gradient-to-r from-cyan-500 to-blue-500 hover:from-cyan-600 hover:to-blue-600 text-lg text-white shadow-lg"
                >
                  지금 시작하기 <ChevronRight className="ml-2 h-5 w-5" />
                </Button>
              </div>
            </motion.div>
          </main>

          <footer className="mt-24 md:mt-32 py-8 text-center text-slate-500 dark:text-slate-400">
            <p>© {new Date().getFullYear()} SpecTrackr. 의생명융합공학부 학생들을 위한 진로 탐색 플랫폼.</p>
          </footer>
        </div>
      </div>
    </div>
  )
}

function FeatureCard({ icon, title, description }: { icon: React.ReactNode; title: string; description: string }) {
  return (
    <motion.div
      whileHover={{ y: -5, transition: { duration: 0.2 } }}
      className="bg-white/90 dark:bg-slate-800/90 backdrop-blur-sm p-6 rounded-xl border border-slate-200 dark:border-slate-700 shadow-lg"
    >
      <div className="bg-gradient-to-r from-cyan-500/20 to-blue-500/20 p-3 rounded-lg w-fit mb-4 text-cyan-600 dark:text-cyan-400">
        {icon}
      </div>
      <h3 className="text-xl font-bold mb-2">{title}</h3>
      <p className="text-slate-600 dark:text-slate-300">{description}</p>
    </motion.div>
  )
}

function Scene() {
  const particlesRef = useRef<THREE.Group>(null)

  useFrame(() => {
    if (particlesRef.current) {
      particlesRef.current.rotation.y += 0.001
    }
  })

  return (
    <>
      <group ref={particlesRef}>
        {Array.from({ length: 50 }).map((_, i) => (
          <Particle key={i} index={i} />
        ))}
      </group>
    </>
  )
}

function Particle({ index }: { index: number }) {
  const ref = useRef<THREE.Mesh>(null)

  // Create a random position for each particle
  const position = [(Math.random() - 0.5) * 15, (Math.random() - 0.5) * 15, (Math.random() - 0.5) * 15]

  // Random size for each particle
  const size = Math.random() * 0.03 + 0.01

  useFrame((state) => {
    if (ref.current) {
      // Slow oscillation based on time
      ref.current.position.y += Math.sin(state.clock.elapsedTime * 0.1 + index) * 0.001
      ref.current.position.x += Math.cos(state.clock.elapsedTime * 0.1 + index) * 0.001
    }
  })

  return (
    <mesh ref={ref} position={position as [number, number, number]}>
      <sphereGeometry args={[size, 8, 8]} />
      <meshStandardMaterial
        color={index % 3 === 0 ? "#06b6d4" : index % 3 === 1 ? "#3b82f6" : "#8b5cf6"}
        emissive={index % 3 === 0 ? "#06b6d4" : index % 3 === 1 ? "#3b82f6" : "#8b5cf6"}
        emissiveIntensity={0.2}
        transparent
        opacity={0.6}
      />
    </mesh>
  )
}
